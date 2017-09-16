# encoding: utf-8

RSpec.describe TTY::Prompt, '#slider' do

  subject(:prompt) { TTY::TestPrompt.new }

  let(:symbols) { TTY::Prompt::Symbols.symbols }

  it "specifies ranges & step" do
    prompt.input << "\r"
    prompt.input.rewind
    expect(prompt.slider('What size?', min: 32, max: 54, step: 2)).to eq(44)
    expect(prompt.output.string).to eq([
      "\e[?25lWhat size? \e[90m(Use arrow keys, press Enter to select)\e[0m\n",
      symbols[:pipe] + symbols[:line] * 6,
      "\e[32m#{symbols[:handle]}\e[0m",
      "#{symbols[:line] * 5 + symbols[:pipe]} 44",
      "\e[2K\e[1G\e[1A\e[2K\e[1G",
      "What size? \e[32m44\e[0m\n\e[?25h"
    ].join)
  end

  it "specifies default value" do
    prompt.input << "\r"
    prompt.input.rewind
    expect(prompt.slider('What size?', min: 32, max: 54, step: 2, default: 38)).to eq(38)
    expect(prompt.output.string).to eq([
      "\e[?25lWhat size? \e[90m(Use arrow keys, press Enter to select)\e[0m\n",
      symbols[:pipe] + symbols[:line] * 3,
      "\e[32m#{symbols[:handle]}\e[0m",
      "#{symbols[:line] * 8 + symbols[:pipe]} 38",
      "\e[2K\e[1G\e[1A\e[2K\e[1G",
      "What size? \e[32m38\e[0m\n\e[?25h"
    ].join)
  end

  it "specifies range through DSL" do
    prompt.input << "\r"
    prompt.input.rewind
    value = prompt.slider('What size?') do |range|
              range.default 6
              range.min 0
              range.max 20
              range.step 2
            end
    expect(value).to eq(6)
    expect(prompt.output.string).to eq([
      "\e[?25lWhat size? \e[90m(Use arrow keys, press Enter to select)\e[0m\n",
      symbols[:pipe] + symbols[:line] * 3,
      "\e[32m#{symbols[:handle]}\e[0m",
      "#{symbols[:line] * 7 + symbols[:pipe]} 6",
      "\e[2K\e[1G\e[1A\e[2K\e[1G",
      "What size? \e[32m6\e[0m\n\e[?25h"
    ].join)
  end

  it "changes display colors" do
    prompt.input << "\r"
    prompt.input.rewind
    options = {active_color: :red, help_color: :cyan}
    expect(prompt.slider('What size?', options)).to eq(5)
    expect(prompt.output.string).to eq([
      "\e[?25lWhat size? \e[36m(Use arrow keys, press Enter to select)\e[0m\n",
      symbols[:pipe] + symbols[:line] * 5,
      "\e[31m#{symbols[:handle]}\e[0m",
      "#{symbols[:line] * 5 + symbols[:pipe]} 5",
      "\e[2K\e[1G\e[1A\e[2K\e[1G",
      "What size? \e[31m5\e[0m\n\e[?25h"
    ].join)
  end

  it "doesn't allow values outside of range" do
    prompt.input << "l\r"
    prompt.input.rewind
    prompt.on(:keypress) do |event|
      if event.value = 'l'
        prompt.trigger(:keyright)
      end
    end
    res = prompt.slider('What size?', min: 0, max: 10, step: 1, default: 10)
    expect(res).to eq(10)
    expect(prompt.output.string).to eq([
      "\e[?25lWhat size? \e[90m(Use arrow keys, press Enter to select)\e[0m\n",
      symbols[:pipe] + symbols[:line] * 10,
      "\e[32m#{symbols[:handle]}\e[0m",
      "#{symbols[:pipe]} 10",
      "\e[2K\e[1G\e[1A\e[2K\e[1G",
      "What size? \n",
      symbols[:pipe] + symbols[:line] * 10,
      "\e[32m#{symbols[:handle]}\e[0m",
      "#{symbols[:pipe]} 10",
      "\e[2K\e[1G\e[1A\e[2K\e[1G",
      "What size? \e[32m10\e[0m\n\e[?25h"
    ].join)
  end
end
