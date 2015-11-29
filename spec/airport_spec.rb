require 'airport'

describe Airport do

  describe '#landing' do

      it 'allows to land and confirm landing' do
        plane = Plane.new
        weather = double(:weather, condition: false)
        subject.land(plane, weather)
        expect(plane.confirmation).to eq "landed"
      end

      it 'prevents landing when stormy' do
        plane = Plane.new
        weather = double(:weather, condition: true)
        expect {subject.land(plane, weather)}.to raise_error 'cannot land, too stormy'
      end
  end

  describe '#take_off' do

      it 'allows to take off and confirm taking off' do
        plane = Plane.new
        weather = double(:weather, condition: false)
        subject.land(plane, weather)
        subject.take_off(plane, weather)
        expect(plane.confirmation).to eq "on air"
      end

      it 'prevents take off if stormy' do
        plane = Plane.new
        weather = double(:weather, condition: false)
        subject.land(plane, weather)
        weather = double(:weather, condition: true)
        expect {subject.take_off(plane, weather)}.to raise_error 'cannot take off, too stormy'
      end
    end
end
