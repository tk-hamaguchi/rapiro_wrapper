require 'spec_helper'

RSpec.describe 'RAPIRO' do
  let(:serial) { double }

  before do
    allow(SerialPort).to receive(:new) { serial }
    allow(serial).to receive(:write)
  end

  it 'decide on a pose' do
    rapiro = RapiroWrapper::Body.new

    commander = rapiro.instance_variable_get(:@commander)
    expect(commander).to be_instance_of RapiroWrapper::Commander

    serial = commander.instance_variable_get(:@serial)
    expect(serial).to eq serial

    expect(rapiro).to respond_to :head=
    expect(rapiro).to respond_to :head
    expect(rapiro).to respond_to :waist=
    expect(rapiro).to respond_to :waist
    expect(rapiro).to respond_to :right_sholder_roll=
    expect(rapiro).to respond_to :right_sholder_roll
    expect(rapiro).to respond_to :right_sholder_pitch=
    expect(rapiro).to respond_to :right_sholder_pitch
    expect(rapiro).to respond_to :right_hand_grip=
    expect(rapiro).to respond_to :right_hand_grip
    expect(rapiro).to respond_to :left_sholder_roll=
    expect(rapiro).to respond_to :left_sholder_roll
    expect(rapiro).to respond_to :left_sholder_pitch=
    expect(rapiro).to respond_to :left_sholder_pitch
    expect(rapiro).to respond_to :left_hand_grip=
    expect(rapiro).to respond_to :left_hand_grip
    expect(rapiro).to respond_to :right_foot_yaw=
    expect(rapiro).to respond_to :right_foot_yaw
    expect(rapiro).to respond_to :right_foot_pitch=
    expect(rapiro).to respond_to :right_foot_pitch
    expect(rapiro).to respond_to :left_foot_yaw=
    expect(rapiro).to respond_to :left_foot_yaw
    expect(rapiro).to respond_to :left_foot_pitch=
    expect(rapiro).to respond_to :left_foot_pitch

    expect(rapiro).to respond_to :eyes=
    expect(rapiro).to respond_to :eyes

    expect(rapiro).to respond_to :sequences
    expect(rapiro.sequences).to eq(
      '#P' \
      'S00A090' \
      'S01A090' \
      'S02A000' \
      'S03A130' \
      'S04A090' \
      'S05A180' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')

    expect(serial).to receive(:write).with(
      '#P' \
      'S00A090' \
      'S01A090' \
      'S02A000' \
      'S03A130' \
      'S04A090' \
      'S05A180' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.head = { left: 40 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A130' \
      'S01A090' \
      'S02A000' \
      'S03A130' \
      'S04A090' \
      'S05A180' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.head = { right: 20 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A090' \
      'S02A000' \
      'S03A130' \
      'S04A090' \
      'S05A180' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.waist = { left: 20 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A110' \
      'S02A000' \
      'S03A130' \
      'S04A090' \
      'S05A180' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.waist = { right: 40 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A000' \
      'S03A130' \
      'S04A090' \
      'S05A180' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.right_sholder_roll = { up: 40 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A040' \
      'S03A130' \
      'S04A090' \
      'S05A180' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.right_sholder_roll = { up: 120 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A130' \
      'S04A090' \
      'S05A180' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.right_sholder_pitch = { up: 30 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A100' \
      'S04A090' \
      'S05A180' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.right_sholder_pitch = { up: 80 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A090' \
      'S05A180' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.right_hand_grip = { open: 10 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A100' \
      'S05A180' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.right_hand_grip = { hold: 20 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A180' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.left_sholder_roll = { up: 20 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A160' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.left_sholder_roll = { up: 90 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A050' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.left_sholder_pitch = { up: 70 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A120' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.left_sholder_pitch = { up: 10 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A060' \
      'S07A090' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.left_hand_grip = { open: 0 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A060' \
      'S07A060' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.left_hand_grip = { hold: 0 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A060' \
      'S07A110' \
      'S08A090' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.right_foot_yaw = { close: 10 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A060' \
      'S07A110' \
      'S08A080' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.right_foot_yaw = { open: 20 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A060' \
      'S07A110' \
      'S08A110' \
      'S09A090' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.right_foot_pitch = { open: 30 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A060' \
      'S07A110' \
      'S08A110' \
      'S09A080' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.right_foot_pitch = { close: 0 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A060' \
      'S07A110' \
      'S08A110' \
      'S09A070' \
      'S10A090' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.left_foot_yaw = { open: 0 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A060' \
      'S07A110' \
      'S08A110' \
      'S09A070' \
      'S10A050' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.left_foot_yaw = { close: 10 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A060' \
      'S07A110' \
      'S08A110' \
      'S09A070' \
      'S10A100' \
      'S11A090' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.left_foot_pitch = { open: 30 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A060' \
      'S07A110' \
      'S08A110' \
      'S09A070' \
      'S10A100' \
      'S11A100' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.left_foot_pitch = { close: 0 }
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A060' \
      'S07A110' \
      'S08A110' \
      'S09A070' \
      'S10A100' \
      'S11A110' \
      'R000G000B128' \
      'T010')
    rapiro.execute!

    rapiro.eyes = '#808000'
    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A060' \
      'S07A110' \
      'S08A110' \
      'S09A070' \
      'S10A100' \
      'S11A110' \
      'R128G128B000' \
      'T010')
    rapiro.execute!

    expect(serial).to receive(:write).with(
      '#P' \
      'S00A070' \
      'S01A050' \
      'S02A120' \
      'S03A050' \
      'S04A080' \
      'S05A090' \
      'S06A060' \
      'S07A110' \
      'S08A110' \
      'S09A070' \
      'S10A100' \
      'S11A110' \
      'R128G128B000' \
      'T128')
    rapiro.execute!(128)
  end
end
