describe NumberToWord do
  let(:number_to_word) { NumberToWord.new 1, 1000 }
  
  describe "single digit" do
    it "1" do
      number_to_word.number_to_word(1).should == "one"
    end
      number_to_word.number_to_word(167).should == "onehundredandsixtyseven"
    end
    it "204"
    it "264" do
      number_to_word.number_to_word(264).should == "twohundredandsixtyfour"
    end
  end

  describe "four digit" do
    it "1000" do
      number_to_word.number_to_word(1000).should == "onethousand"
    end
  end

  describe "solver" do
    it "1 to 1000" do
      number_to_word.solver.should == 21124
    end
  end
end
