require "yaml"

files = Dir.glob("*/action.yml")
abort "No composite actions found" if files.empty?

files.each do |file|
  action = YAML.safe_load(File.read(file))
  abort "#{file}: expected a composite action" unless action.dig("runs", "using") == "composite"

  action.fetch("runs").fetch("steps").each do |step|
    if step.key?("uses")
      ref = step.fetch("uses")
      abort "#{file}: action dependency must use a full commit SHA: #{ref}" unless ref.match?(/\A[^@\s]+@[0-9a-f]{40}\z/)
    elsif !step.key?("run") || !step.key?("shell")
      abort "#{file}: each run step needs an explicit shell"
    end
  end
end

puts "Validated #{files.length} composite actions"
