require 'bitcodin/version'
require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest_client'

require 'bitcodin/input/http_input_config'
require 'bitcodin/output/s3_output_config'
require 'bitcodin/output/gcs_output_config'
require 'bitcodin/output/ftp_output_config'
require 'bitcodin/media/encoding_profile'
require 'bitcodin/network/http'

module Bitcodin

  class BitcodinAPI

    def initialize(apiKey)
      @apiKey  = apiKey
      @apiURL  = 'http://portal.bitcodin.com/api/'
      @headers = {
          :content_type => 'application/json',
          :bitcodin_api_version => 'v1',
          :bitcodin_api_key => @apiKey
      }
      @httpClient = HTTP.new(@apiKey, @headers)
    end

    def getKey
      return @apiKey
    end

    # Input

    # Create a new Input, which will be analyzed and used for transcoding jobs.
    def createInput(inputConfig)
      url = @apiURL.concat('input/create')
      return @httpClient.sendRequest('post', url, inputConfig.values)
    end

    # An existing input will be analyzed again and a new thumbnail will be created.
    def analyzeInput(id)
      url = @apiURL.concat('input/').concat(id.to_s).concat('/analyze')
      return @httpClient.sendRequest('patch', url)
    end

    def listInput(page = nil)
      url = @apiURL.concat('inputs')
      if page.nil?
        return @httpClient.sendRequest('get', url)
      else
        url = url.concat('/').concat(page.to_s)
        return @httpClient.sendRequest('get', url)
      end
    end

    def getInputDetails(id)
      url = @apiURL.concat('input/').concat(id.to_s)
      return @httpClient.sendRequest('get', url)
    end

    def deleteInput(id)
      url = @apiURL.concat('input/').concat(id.to_s)
      return @httpClient.sendRequest('delete', url)
    end

    # Output

    def createS3Output(config)
      url = @apiURL.concat('output/create')
      return @httpClient.sendRequest('post', url, config.values)
    end

    def createGCSOutput(config)
      url = @apiURL.concat('output/create')
      return @httpClient.sendRequest('post', url, config.values)
    end

    def createFTPOutput(config)
      url = @apiURL.concat('output/create')
      return @httpClient.sendRequest('post', url, config.values)
    end

    def listOutputs(page = nil)
      url = @apiURL.concat('outputs')
      if page.nil?
        return @httpClient.sendRequest('get', url)
      else
        url = url.concat('/').concat(page.to_s)
        return @httpClient.sendRequest('get', url)
      end
    end

    def getOutputDetails(id)
      url = @apiURL.concat('output/').concat(id.to_s)
      return @httpClient.sendRequest('get', url)
    end

    def deleteOutput(id)
      url = @apiURL.concat('output/').concat(id.to_s)
      return @httpClient.sendRequest('delete', url)
    end

    # Encoding Profiles

    def createEncodingProfile(config)
      url = @apiURL.concat('encoding-profile/create')
      return @httpClient.sendRequest('post', url, config.values)
    end

    def listEncodingProfiles(page = nil)
      url = @apiURL.concat('encoding-profiles')
      if page.nil?
        return @httpClient.sendRequest('get', url)
      else
        url = url.concat('/').concat(page.to_s)
        return @httpClient.sendRequest('get', url)
      end
    end

    def getEncodingProfile(id)
      url = @apiURL.concat('encoding-profile/').concat(id.to_s)
      return @httpClient.sendRequest('get', url)
    end

    def deleteEncodingProfile(id)
      url = @apiURL.concat('encoding-profile/').concat(id.to_s)
      return @httpClient.sendRequest('delete', url)
    end

    # Jobs

    def createJob(jobConfig)

    end

    def listAllJobs(page = nil)

    end

    def getJobDetails(id)

    end

    def getCurrentJobStatus(id)

    end

    def createTransferJob(transferConfig)

    end

    def listTransferJob(id)

    end

    # Statistics

    def getCurrentOutputStatus(from, to)

    end

    def getJobStatistics

    end

    # Paymant

    def updateInvoiceInfos(invoiceInfos)

    end

    def getInvoiceInfos

    end

    # Wallet

    def getWalletInformation

    end

    def getListOfAllDeposits

    end

    def getListOfAllBills

    end

  end
end