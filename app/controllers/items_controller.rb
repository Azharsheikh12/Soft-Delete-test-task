class ItemsController < ApplicationController
    
	def index
		@items = Item.all.order(created_at: :desc)
	end	
	
	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to items_path, notice: 'Item was successfully created.'
		else
			@items = Item.all.order(created_at: :desc)
			flash.now[:alert] = 'There was an error creating the item.'
			render :index
		end
	end

	def destroy
		@item = Item.find(params[:id])
		if @item.soft_delete
			redirect_to items_path, notice: 'Item was successfully deleted.'
		else
			redirect_to items_path, alert: 'Failed to delete the item.'
		end
	end

	def restore
		@item = Item.unscoped.find(params[:id])
		if @item.restore
				redirect_to items_path, notice: 'Item was successfully restored.'
		else
				redirect_to items_path, alert: 'Failed to restore the item.'
		end
	end

	private
	
	def item_params
		params.permit(:name)
	end
end
