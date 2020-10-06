class MemosController < ApplicationController

  def create
    @memo = Memo.create(memo_params)
  end

  def update
    @memo = Memo.find(params[:id])
    @memo.update(memo_params)
  end

  private
  def memo_params
    params.require(:memo).permit(:content).merge(user_id: current_user.id)
  end
end
