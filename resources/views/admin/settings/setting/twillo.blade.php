<div class="header-bar">
    <div class="table-title">
        <h3>{{__('Twillo Setup')}}</h3>
    </div>
</div>
<div class="profile-info-form">
    <form action="{{route('adminSaveSmsSettings')}}" method="post"
          enctype="multipart/form-data">
        @csrf
        <div class="row">
            <div class="col-lg-6 col-12  mt-20">
                <div class="form-group">
                    <label for="#">{{__('Twillo SID')}}</label>
                    @if(env('APP_MODE') == 'demo')
                        <input type="text" class="form-control" value="{{ __('disablefordemo') }}">
                    @else
                    <input class="form-control" type="text" name="twillo_secret_key"
                           placeholder="{{__('Secret SID')}}"
                           value="{{$settings['twillo_secret_key']}}">
                    @endif
                </div>
            </div>
            <div class="col-lg-6 col-12  mt-20">
                <div class="form-group">
                    <label for="#">{{__('Twillo Token')}}</label>
                    @if(env('APP_MODE') == 'demo')
                        <input type="text" class="form-control" value="{{ __('disablefordemo') }}">
                    @else
                    <input class="form-control" type="text" name="twillo_auth_token"
                           placeholder="{{__('Auth Token')}}"
                           value="{{$settings['twillo_auth_token']}}">
                    @endif
                </div>
            </div>
            <div class="col-lg-6 col-12  mt-20">
                <div class="form-group">
                    <label for="#">{{__('Twillo From')}}</label>
                    @if(env('APP_MODE') == 'demo')
                        <input type="text" class="form-control" value="{{ __('disablefordemo') }}">
                    @else
                    <input class="form-control" type="text" name="twillo_number"
                           placeholder="{{__('From number')}}"
                           value="{{isset($settings['twillo_number']) ? $settings['twillo_number'] : ''}}">
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
