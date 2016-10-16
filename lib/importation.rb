class Importation

  def initialize
    @columns = {}
    @message = ''
  end

  def import_xls(file)
    xlsx = Roo::Spreadsheet.open(file)
    sheet = xlsx.sheet(0)

    sheet.each_with_index(@columns) do |hash, index|
      next if index == 0
      self.process_row(hash)
    end

    self.success_message
  end

  def process_row(hash)
    raise Exception.new('Method not implemented')
  end

  def success_message()
    raise Exception.new('Method not implemented')
  end

end
