class PdfCertificateController # < ApplicationController
  require "prawn"

  Prawn::Document.generate("hello.pdf") do
    text "Hello World!"
  end
end
