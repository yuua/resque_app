require 'spec_helper'

describe 'Job base test' do
  let(:job) { JobBase.new }

  @env = true

  it 'job base のクラス変数envがnilであること' do
    class JobBaseTest < JobBase
      JobBase.new
      @env = @@env
    end
    expect(@env).to be_nil
  end

  describe "時間関連のテスト" do

    context '日時を2015/05/05 21:00:00に固定' do
      before :all do
        Timecop.freeze(Time.new(2015,5,5,21,0,0))
      end
      # テスト後正常日時に戻す
      after :all do
        Timecop.return
      end

      it { expect(job.get_now_day).to eq '2015-05-05' }

      it { expect(job.get_now_month).to eq '05' }

      it { expect(job.get_yesterday).to eq '2015-05-04' }

      # レシーバ省略
      subject { job.get_one_hours_ago }
      it { is_expected.to eq '20' }

    end

  end
end
