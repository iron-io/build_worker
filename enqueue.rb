require 'iron_worker_ng'

@iw = IronWorkerNG::Client.new

# This is the input required for the worker
payload = {
    token: @iw.token,
    project_id: @iw.project_id,
    url: "https://github.com/treeder/hello_worker/blob/master/hello.worker"
}

# Queue up the task
task = @iw.tasks.create("builder", payload)

# wait for task to complete and print the cdlog
p @iw.tasks.wait_for(task.id)
puts @iw.tasks.log(task.id)
