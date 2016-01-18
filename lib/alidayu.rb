require "alidayu/version"
require 'net/http'
require 'json'

module Alibaba
  class Bigfish

    def self.sign_parmas_with_secret(params,secret)
      str = params.sort.map { |item| item.join('') }.join('')
      str_with_secret = "#{secret}#{str}#{secret}"
      Digest::MD5.hexdigest(str_with_secret).upcase
    end

    def send_sms(params={})
      required_params = {app_key: '23301028',
                         format: 'json',
                         method: 'alibaba.aliqin.fc.sms.num.send',
                         sign_method: 'md5',
                         timestamp: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
                         v: '2.0',
                         rec_num: '18651206017',
                         sms_free_sign_name: '活动验证',
                         sms_param: "{'code':123456','product':'药药灵','item':'吃药'}",
                         # sms_param: params.to_json,
                         sms_template_code: 'SMS_4775414',
                         sms_type: 'normal'}
                         
      sign = Alibaba::Bigfish.sign_parmas_with_secret(required_params,'befe6295b9ef01191f385b63268e625f')

      signed_parmas = required_params.merge({sign: sign})

      uri = URI('http://gw.api.taobao.com/router/rest')
      res = Net::HTTP.post_form(uri,signed_parmas)
      puts res.body
    end

  end
end
