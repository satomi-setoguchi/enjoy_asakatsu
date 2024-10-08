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
      redirect_to records_path, success: t('flash_message.created', item: Record.model_name.human)
    else
      flash.now[:danger] = t('flash_message.not_created', item: Post.model_name.human)
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = current_user.records.find(params[:id])
    if @record.update(record_params)
      redirect_to record_path(@record), success: t('flash_message.updated', item: Record.model_name.human)
    else
      flash.now[:danger] = t('flash_message.updated', item: Record.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    record = current_user.records.find(params[:id])
    record.destroy!
    redirect_to records_path, status: :see_other, success: "削除しました"
  end


  def start_time
    self.date
  end
  private

  def record_params
    params.require(:record).permit(:date, :started_time, :finished_time, :content, :memo)
  end

end
