class Importation

  def import_xls(file)
    xlsx = Roo::Spreadsheet.open(file.path)

    sheet.each(first_name: 'Nombre', last_name: 'Apellido') do |hash|
      self.process_row(hash)
    end
  end

  def do_with_row(hash)
    raise Exception.new('Method not implemented')
  end

end
