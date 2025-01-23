ARGV.each do |path|
    content = File.read(path)
    next if content =~ /\A---/

    m = content.match(/\A#\s+(.*)/)
    if m
        title = m[1]
        content = m.post_match

        File.open(path, 'w') do |fw|
            fw.print <<END
---
title: "#{title}"
weight: 1
---
#{content}
END
        end
    end
end
