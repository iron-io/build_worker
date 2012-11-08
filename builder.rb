require 'iron_worker_ng'

client = IronWorkerNG::Client.new(:project_id => params[:project_id], :token => params[:token])
code = IronWorkerNG::Code::Base.new(:workerfile => params[:url])
code.full_remote_build = true
client.codes.create(code)

