@extends('admin.master',['menu'=>'theme-setting', 'sub_menu'=>'user-theme-color'])
@section('title', isset($title) ? $title : '')
@section('style')
@endsection
@section('content')
    <!-- breadcrumb -->
    <div class="custom-breadcrumb">
        <div class="row">
            <div class="col-9">
                <ul>
                    <li class="active-item">{{ $title }}</li>
                </ul>
            </div>
            <div class="col-3">
                <a class="btn theme-btn float-right" href="{{route('resetUserThemeColor')}}">{{__('Reset Color')}}</a>
            </div>
        </div>
    </div>
    <!-- /breadcrumb -->
    <!-- User Management -->
    <div class="user-management add-custom-page">
        <div class="row">
            <div class="col-12">
                
                <div class="profile-info-form">
                    <div class="card-body">
                        <form action="{{route('userThemeColorSave')}}" method="POST">
                            @csrf
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">{{__('Navbar Menu Text Color')}} {{(isset($item))}}</label>
                                        <input type="color" class="form-control" name="user_theme_navbar_menu_text_color"
                                        @if (isset($item) && isset($item['user_theme_navbar_menu_text_color']))
                                            value="{{$item['user_theme_navbar_menu_text_color']}}"
                                        @else
                                            value="#5B5B5B"
                                        @endif>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">{{__('Navbar Active Menu Text Color')}}</label>
                                        <input type="color" class="form-control" name="user_theme_navbar_active_menu_text_color"
                                        @if (isset($item) && isset($item['user_theme_navbar_active_menu_text_color']))
                                            value="{{$item['user_theme_navbar_active_menu_text_color']}}"
                                        @else
                                            value="#FC541F"
                                        @endif>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">{{__('Navbar Background Color')}}</label>
                                        <input type="color" class="form-control" name="user_theme_navbar_background_color"
                                        @if (isset($item) && isset($item['user_theme_navbar_background_color']))
                                            value="{{$item['user_theme_navbar_background_color']}}"
                                        @else
                                            value="#ffffff"
                                        @endif>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">{{__('Body Background Color')}}</label>
                                        <input type="color" class="form-control" name="user_theme_body_background_color"
                                        @if (isset($item) && isset($item['user_theme_body_background_color']))
                                            value="{{$item['user_theme_body_background_color']}}"
                                        @else
                                            value="#EEF0F8"
                                        @endif>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">{{__('Card Body Background Color')}}</label>
                                        <input type="color" class="form-control" name="user_theme_card_body_background_color"
                                        @if (isset($item) && isset($item['user_theme_card_body_background_color']))
                                            value="{{$item['user_theme_card_body_background_color']}}"
                                        @else
                                            value="#ffffff"
                                        @endif>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">{{__('Primary Text Color')}}</label>
                                        <input type="color" class="form-control" name="user_theme_primary_text_color"
                                        @if (isset($item) && isset($item['user_theme_primary_text_color']))
                                            value="{{$item['user_theme_primary_text_color']}}"
                                        @else
                                            value="#575a63"
                                        @endif>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">{{__('Secondary Text Color')}}</label>
                                        <input type="color" class="form-control" name="user_theme_secondary_text_color"
                                        @if (isset($item) && isset($item['user_theme_secondary_text_color']))
                                            value="{{$item['user_theme_secondary_text_color']}}"
                                        @else
                                            value="#656b96"
                                        @endif>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">{{__('Warning Text Color')}}</label>
                                        <input type="color" class="form-control" name="user_theme_warning_text_color"
                                        @if (isset($item) && isset($item['user_theme_warning_text_color']))
                                            value="{{$item['user_theme_warning_text_color']}}"
                                        @else
                                            value="#656b96"
                                        @endif>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">{{__('Link Text Color')}}</label>
                                        <input type="color" class="form-control" name="user_theme_link_text_color"
                                        @if (isset($item) && isset($item['user_theme_link_text_color']))
                                            value="{{$item['user_theme_link_text_color']}}"
                                        @else
                                            value="#dc8725"
                                        @endif>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">{{__('Button Text Color')}}</label>
                                        <input type="color" class="form-control" name="user_theme_button_text_color"
                                        @if (isset($item) && isset($item['user_theme_button_text_color']))
                                            value="{{$item['user_theme_button_text_color']}}"
                                        @else
                                            value="#ffffff"
                                        @endif>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">{{__('Button Background Color')}}</label>
                                        <input type="color" class="form-control" name="user_theme_button_background_color"
                                        @if (isset($item) && isset($item['user_theme_button_background_color']))
                                            value="{{$item['user_theme_button_background_color']}}"
                                        @else
                                            value="#50525a"
                                        @endif>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="">{{__('Active Button Background Color')}}</label>
                                        <input type="color" class="form-control" name="user_theme_active_button_background_color"
                                        @if (isset($item) && isset($item['user_theme_active_button_background_color']))
                                            value="{{$item['user_theme_active_button_background_color']}}"
                                        @else
                                            value="#474747"
                                        @endif>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button class="button-primary theme-btn">@if(isset($item)) {{__('Update')}} @else {{__('Save')}} @endif</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

@endsection

@section('script')
    
@endsection
