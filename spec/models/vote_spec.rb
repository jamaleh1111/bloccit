describe Vote do 
  describe "validations" do
    describe "value validations" do
      it "only allows -1 or 1 as values" do
        # your expectations here
        upvote = Vote.new(v: 1)
        expect(upvote.valid?).to eq(true)
      
        downvote = Vote.new(v: -1)
        expect(downvote.valid?).to eq(true)
    
        invalidvote = Vote.new(v: < 1)
        expect(invalidvote.valid?).to eq(false)
      end 
    end 
  end 
end 