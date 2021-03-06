describe NumberToWord do
  let(:number_to_word) { NumberToWord.new 1, 1000 }
  
  describe "single digit" do
    it "1" do
      number_to_word.number_to_word(1).should == "one"
    end
    it "3" do
      number_to_word.number_to_word(3).should == "three"
    end
  end

  describe "two digit" do
    it "10" do
      number_to_word.number_to_word(10).should == "ten"
    end
    it "13" do
      number_to_word.number_to_word(13).should == "thirteen"
    end
    it "46" do
      number_to_word.number_to_word(46).should == "fortysix"
    end
    it "66" do
      number_to_word.number_to_word(66).should == "sixtysix"
    end
    it "99" do
      number_to_word.number_to_word(99).should == "ninetynine"
    end
  end

  describe "three digit" do
    it "100" do
      number_to_word.number_to_word(100).should == "onehundred"
    end
    it "101" do
      number_to_word.number_to_word(101).should == "onehundredandone"
    end
    it "112" do
      number_to_word.number_to_word(112).should == "onehundredandtwelve"
    end
    it "142" do
      number_to_word.number_to_word(142).should == "onehundredandfortytwo"
    end
    it "167" do
      number_to_word.number_to_word(167).should == "onehundredandsixtyseven"
    end
    it "204" do
      number_to_word.number_to_word(204).should == "twohundredandfour"
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
