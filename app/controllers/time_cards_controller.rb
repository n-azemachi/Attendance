class TimeCardsController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  before_action :findtimecard, only: [:show, :edit, :update, :destroy]
 # before_action :validate_user, only: [:show, :edit, :update, :destroy]
  def home
  end

  def index
    @time_cards = current_user.time_cards.order(day: :asc)
    
    if params[:id].present?
    findtimecard
    else
    @time_card = TimeCard.new
    end
  end
  
  def new
    @time_card = TimeCard.new
  end
  
  def create
    @time_card = TimeCard.new(time_card_params)
    @time_card.user_id = current_user.id
    respond_to do |format|
      if @time_card.save
        format.html { redirect_to time_cards_path, notice: '勤怠を登録しました！' }
        format.json { render :index, status: :created, location: @time_card }
        # 追加
        format.js { @status = "success" }
      else
        format.html { render :index }
        format.json { render json: @time_card.errors, status: :unprocessable_entity }
        # 追加
        format.js { @status = "fail" }
      end
    end
  end
  
  def update
    respond_to do |format|
    if @time_card.update(time_card_params)
      format.html { redirect_to time_cards_path, notice: "勤怠を更新しました" }
      format.json { render :index, status: :ok, location: @time_card }
    else
      format.html { render :index }
      format.json { render json: @time_card.errors, status: :unprocessable_entity }
    end
  end
  
  end
  
  def destroy
    if @time_card.destroy
      redirect_to time_cards_path, notice: "勤怠を削除しました"
    else
      redirect_to time_cards_path, alert: "勤怠を削除できませんでした。必要があれば管理者にお問い合わせ下さい"
    end
  end
  
  private
  
  def findtimecard
    @time_card = TimeCard.find(params[:id])
  end
  
  def time_card_params
    params.require(:time_card).permit(:division, :day, :starttime, :endtime)
  end
  
  def validate_user
    if @time_card.user != current_user
      redirect_to root_path, alert: "他のアカウントを参照する場合は管理者ユーザー、またはログインし直して下さい"
    end
  end
  
end
