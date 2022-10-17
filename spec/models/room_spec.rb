require 'rails_helper'

RSpec.describe Room, type: :model do
  it { is_expected.to have_many :bookings }

  it 'is valid if image is attached' do
    file = Rails.root.join('spec', 'support', 'assets', 'rooms_photos', 'room_photo.jpg')
    image = ActiveStorage::Blob.create_and_upload!(
      io: File.open(file, 'rb'),
      filename: 'room_photo-box.jpg',
      content_type: 'image/jpeg'
    ).signed_id
    rooms_photos = Room.new(image:)
    expect(rooms_photos.valid?).to eq true
  end
end
