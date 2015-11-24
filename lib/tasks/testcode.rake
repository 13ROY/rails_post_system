namespace :testcode do
  unless Rails.env == 'production'
#    require 'rspec/core/rake_task'
    require 'rubocop/rake_task'
    require 'reek/rake/task'

#    desc 'Execute Rspec'
#    RSpec::Core::RakeTask.new(:spec) do | tsk |
#      tsk.rspec_opts = '--format p'
#    end

    desc 'Execute rubocop'
    RuboCop::RakeTask.new(:rubocop) do | tsk |
      # Rails, display cop name, output format and file output
      report = ($CIRCLE_ARTIFACTS) ? "#{$CIRCLE_ARTIFACTS}/rubocop_report.json" : 'rubocop_report.json'
      tsk.options = ['-DR', '--format', 'json', '--out', "#{report}"]
      tsk.fail_on_error = false
    end

    desc 'Execute reek'
    Reek::Rake::Task.new do | tsk |
      tsk.source_files = '{app, lib, config}/**/*.rb, lib/tasks/*.rake'
      tsk.fail_on_error = false
      # tsk.verbose = true
    end

#    desc 'Execute haml-lint'
#    task haml_lint: :environment do
#      puts 'HAML-LINT'
#      puts %x(haml-lint .)
#    end

#    desc 'Execute rails_best_practices'
#    task rbp::environment do
#      require 'rails_best_practices'
#      analyzer = RailsBestPractices::Analyzer.new('.')
#      analyzer.analyze
#      puts analyzer.output
#    end

  end
end

task :testcode do
  %w(rubocop reek).each { | task | Rake::Task["testcode:#{task}"].invoke }
end