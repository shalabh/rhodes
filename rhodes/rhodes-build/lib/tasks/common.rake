$buildyml = "build.yml"

namespace "config" do
  task :common do
    $config = Jake.config(File.open($buildyml))  
    $basedir = pwd
    $bindir = File.join($basedir,'bin')
    $tmpdir = File.join($bindir,'tmp')
    $targetdir =  File.join($bindir,'target')

    $srcdir = File.join($bindir, '/RhoBundle')

    $compileERBbase = File.join(File.dirname(__FILE__),'..','compileERB')
    $compileRBbase = File.join(File.dirname(__FILE__),'..','compileRB')

    $appmanifest = File.join(File.dirname(__FILE__),'..','manifest','createAppManifest.rb')
    $res = File.join(File.dirname(__FILE__),'..','..','res')
    $prebuilt = File.join($res,'prebuilt')

  end
end

task :makedirs do
    mkdir_p $bindir if not File.exists? $bindir
    mkdir_p $tmpdir if not File.exists? $tmpdir
    mkdir_p $targetdir if not File.exists? $targetdir
end

namespace "bundle" do
  task :common do
  end
end

Rake::TaskManager.class_eval do
  def remove_task(task_name)
    @tasks.delete(task_name.to_s)
  end
end
 
def remove_task(task_name)
  Rake.application.remove_task(task_name)
end

