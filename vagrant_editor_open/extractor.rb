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
    break_index = argv.index("--a")
    [argv[break_index - 1], argv[break_index + 1]]
  end
end
