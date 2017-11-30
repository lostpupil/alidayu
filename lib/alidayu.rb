require "alidayu/version"
require 'net/http'
require 'json'

module Alibaba
  class Bigfish

    # http:
    # https:

    def initialize(key, secret, https=true)
      @key = key
      @secret = secret

      @server = https ? "https://eco.taobao.com/router/rest" : "http://gw.api.taobao.com/router/rest"
    end

    def send_sms(params={})
      required_params = {app_key: @key,
                         format: 'json',
                         method: 'alibaba.aliqin.fc.sms.num.send',
                         sign_method: 'md5',
                         timestamp: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
                         v: '2.0',
                         rec_num: params[:rec_num],
                         sms_free_sign_name: params[:sms_free_sign_name],
                         # sms_param: "{'code':123456','product':'药药灵','item':'吃药'}",
                         sms_param: params[:sms_param].to_json,
                         sms_template_code: params[:sms_template_code],
                         sms_type: 'normal'}

      sign = sign_parmas(required_params)
      signed_parmas = required_params.merge({sign: sign})

      uri = URI(@server)
      res = Net::HTTP.post_form(uri,signed_parmas)
      return res.body
    end


    def singlecall_tts(params={})
      required_params = {app_key: @key,
                         format: 'json',
                         method: 'alibaba.aliqin.fc.tts.num.singlecall',
                         sign_method: 'md5',
                         timestamp: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
                         v: '2.0',
                         called_num: params[:called_num],
                         called_show_num: params[:called_show_num],
                         # tts_param: "{'code':123456','product':'药药灵','item':'吃药'}",
                         tts_param: params[:tts_param].to_json,
                         tts_code: params[:tts_code]
                         }

      sign = sign_parmas(required_params)
      signed_parmas = required_params.merge({sign: sign})

      uri = URI(@server)
      res = Net::HTTP.post_form(uri,signed_parmas)
      return res.body
    end

    private

    def sign_parmas(params)
      str = params.sort.map { |item| item.join('') }.join('')
      str_with_secret = "#{@secret}#{str}#{@secret}"
      Digest::MD5.hexdigest(str_with_secret).upcase
    end
  end
end
