class RecordsController < ApplicationController

  def index
    @records = current_user.records.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
  end

  def create
    @record = current_user.records.build(record_params)
    if @record.save
      redirect_to records_path, success: "作成しました"
    else
      flash.now[:danger] = "作成できませんでした"
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = current_user.records.find(params[:id])
    if @record.update(record_params)
      redirect_to record_path(@record), success: "保存しました"
    else
      flash.now[:danger] = "保存できませんでした"
      render :edit, status: :unprocessable_entity
    end
  end

  def start_time
    self.date
  end
  private

  def record_params
    params.require(:record).permit(:date, :started_time, :finished_time, :content, :memo)
  end

end
