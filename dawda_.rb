describe NumberToWord do
  let(:number_to_word) { NumberToWord.new 1, 1000 }
  
  describe "single digit" do
    it "1" do
      number_to_word.number_to_word(1).should == "one"
    end
    it "3" do
      number_to_word.number_to_word(3).should == "three"
    d(204).should == "twohundredandfour"
    end
    it "214" do
      number_to_word.number_to_word(214).should == "twohundredandfourteen"
    end
    it "254" do
      number_to_word.number_to_word(254).should == "twohundredandfiftyfour"
    end
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
