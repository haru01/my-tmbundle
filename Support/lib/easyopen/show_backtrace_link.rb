def backtrace_link(backtrace_log)
  link = []
  prev_line = nil
  File.open(backtrace_log) do |file|
    file.each do |line|
      if m = /^(.*):(\d+):.*$/.match(line) 
        url = m[1].gsub(/^\.\//, "#{ENV['TM_PROJECT_DIRECTORY']}/")
        url = url.gsub(/^\.\.\//, "/")
        link << a_herf(url, m[2], "#{url}:#{m[2]}")
      end
    end
  end
  link
end

def a_herf(url, line, display)
  %Q+<Font Size="2" Color="#0000ff"><a href="txmt://open?url=file://#{url}&line=#{line}">#{display}</a></Font><br/>+
end

puts backtrace_link("#{ENV["TM_PROJECT_DIRECTORY"]}/bt.log")
