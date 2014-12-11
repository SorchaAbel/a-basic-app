pdf.text "STAGE SCHOOL", :size => 25, :style => :bold, :color => "ffd700", :align => :center
move_down 5
pdf.text "Certificate of Completion", :size => 25, :style => :bold, :color => "ffd700",  :align => :center
move_down 10
stroke_horizontal_rule
move_down 40
pdf.text "Student: #{@result.student.name}", :size => 15, :style => :bold, :color => "094ba7", :align => :center
move_down 20
pdf.text "Course: Speech & Drama", :size => 15, :style => :bold, :color => "094ba7", :align => :center
move_down 20
pdf.text "Term: #{@result.term_id}", :size => 15, :style => :bold, :color => "094ba7", :align => :center
move_down 20
pdf.text "Final Result: #{@result.grade}", :size => 15, :style => :bold, :color => "094ba7", :align => :center
move_down 20