class Importation

  def initialize
    @columns = {}
  end

  def import_xls(file)
    # xlsx = Roo::Spreadsheet.open(file.path)
    xlsx = Roo::Spreadsheet.open(file)
    sheet = xlsx.sheet(0)

    sheet.each(@columns) do |hash|
      self.process_row(hash)
    end
  end

  def process_row(hash)
    raise Exception.new('Method not implemented')
  end

end
