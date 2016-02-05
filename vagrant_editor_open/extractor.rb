class Extractor
  def self.extract_path(argv)
    path = get_clicked_line(argv)
    path if valid_file_path?(path)
  end

  def self.get_clicked_line(argv)
    before_click, after_click = get_before_and_after_click(argv)

    chars_before_click = before_click.match(/(\S+)$/)[-1]
    chars_after_click  = after_click.match(/^(\S+)/)[0]

    chars_before_click + chars_after_click
  end

  def self.valid_file_path?(path)
    path.match(/^[\w\/_.]+(:\d+)?$/)
  end

  def self.iterm_is_sending_extra_params(argv)

  end

  def self.get_before_and_after_click(argv)
    if argv.count == 2
      [argv[0], argv[1]]
    elsif argv.count == 3
      [argv[1], argv[2]]
    elsif argv.count == 5
      [argv[2], argv[3]]
    end
  end
end
