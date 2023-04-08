<div class="header-bar">
    <div class="table-title">
        <h3>{{__('Others API')}}</h3>
    </div>
</div>
<div class="profile-info-form">
    <form action="{{route('adminSaveOthersApiSettings')}}" method="post">
        @csrf
        <div class="row">
            <div class="col-lg-6 col-12  mt-20">
                <div class="form-group">
                    <label>{{__('CryptoCompare API')}}</label>
                    @if(env('APP_MODE') == 'demo')
                        <input type="text" class="form-control" value="{{ __('disablefordemo') }}">
                    @else
                    <input class="form-control" type="text" name="cryptoCompare" required
                           placeholder="" value="{{$settings['cryptoCompare'] ?? ''}}">
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
