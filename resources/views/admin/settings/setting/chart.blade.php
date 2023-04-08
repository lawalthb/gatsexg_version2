<div class="header-bar">
    <div class="table-title">
        <h3>{{__('Chart Setup')}}</h3>
    </div>
</div>
<div class="profile-info-form">
    <form action="{{route('adminSaveChartSettings')}}" method="post"
          enctype="multipart/form-data">
        @csrf
        <div class="row">
            <div class="col-lg-6 col-12  mt-20">
                <div class="form-group">
                    <label>{{__('x-rapidapi-host')}}</label>
                    @if(env('APP_MODE') == 'demo')
                        <input type="text" class="form-control" value="{{ __('disablefordemo') }}">
                    @else
                    <input class="form-control" type="text" name="host_chart" required
                           placeholder="" value="{{$settings['host_chart'] ?? ''}}">
                    @endif
                </div>
            </div>
            <div class="col-lg-6 col-12  mt-20">
                <div class="form-group">
                    <label>{{__('x-rapidapi-key')}}</label>
                    @if(env('APP_MODE') == 'demo')
                        <input type="text" class="form-control" value="{{ __('disablefordemo') }}">
                    @else
                    <input class="form-control" type="text" name="key_chart" required
                           placeholder="" value="{{$settings['key_chart'] ?? ''}}">
                    @endif
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-2 col-12 mt-20">
                <button type="submit" class="button-primary theme-btn">{{__('Update')}}</button>
            </div>
        </div>
    </form>
</div>
