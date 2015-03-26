class EventsController < ApplicationController

  before_action :set_event, :only =>[:show, :edit, :update, :destroy]

  #GET /events/index
  def index
    #Event 是model name
    @events = Event.all
  end

  def new
    @event = Event.new
  end

#  def create
#    @event = Event.new(params[:event])
#    @event.save
#
#    redirect_to :action => :index

#    create Action會透過從表單傳進來的資料，也就是Rails提供
#    的params參數(這是一個Hash)，來實例化一個新的@event物件。
#    成功儲存之後，便將使用者重導(redirect)至index Action顯示活動列表。

#     讓我們來實際測試看看，在瀏覽器中實際按下表單的Create按鈕後，出現了
#     ActiveModel::ForbiddenAttributesError in EventsController#create的錯誤訊息，
#     這是因為Rails會檢查使用者傳進來的參數必須經過一個過濾的安全步驟，
#     這個機制叫做Strong Parameters，讓我們回頭修改
#  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to :url => events_path, :method=> :get
    else
      render :action => :new
    end

    # redirect_to :action => :index
    # redirect_to events_path, :method => :get
    flash[:notice] = "Successfully created event"
  end

  def show
    # 用set_event 代替
    # @event = Event.find(params[:id])
    @page_title = @event.name
  end

  def edit
    # 用set_event 代替
    # @event = Event.find(params[:id])
    @window_title = @event.name
  end

  def update
    # 用set_event 代替
    # @event = Event.find(params[:id])

    @event.update(event_params)

    if @event.save
      redirect_to :url => event_path, :method => :get
    else
      render :action=> :edit
    end

    # redirect_to :action => :show, :id =>@event
    redirect_to event_path(@event), :method => :get
    flash[:notice] = "Successfully updated event"
  end

  def destroy
    # 用set_event 代替
    # @event = Event.find(params[:id])
    @event.destroy

    # redirect_to :action => :index
    redirect_to events_path, :method => :get
    flash[:alert] = "Successfully deleted event"
  end

  private

#  我們新加了一個event_params方法，其中透
#  過require和permit將params這個Hash過濾出params[:event][:name]和
#  params[:event][:description]。
  def event_params
    #只允許傳進來的值是name 跟 description 的文字,
    params.require(:event).permit(:name, :description)
  end

  def set_event
    @event= Event.find(params[:id])

  end


end
