@extends('admin.master',['menu'=>'admin','sub_menu'=>'admin_list'])
@section('title', isset($title) ? $title : '')
@section('style')
@endsection
@section('content')
    <!-- breadcrumb -->
    <div class="custom-breadcrumb">
        <div class="row">
            <div class="col-12">
                <ul>
                    <li>{{__('User management')}}</li>
                    <li class="active-item">{{__('Edit Admin')}}</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /breadcrumb -->
    <!-- User Management -->
    <div class="user-management profile">
        <div class="row">
            <div class="col-12">
                <div class="profile-info padding-40">
                    <div class="row">
                        <div class="col-xl-4 mb-xl-0 mb-4">
                            <div class="user-info text-center">
                                <div class="avater-img">
                                    <img src="{{show_image($user->id,'user')}}" alt="">
                                </div>
                                <h4>{{$user->first_name}} {{$user->last_name}}  ({{$user->username}}) </h4>
                                <p>{{$user->email}}</p>
                            </div>
                        </div>
                        <div class="col-xl-8">
                            <form action="{{route('adminAddEdit')}}" method="post">
                                @csrf
                                <input type="hidden" name="id" value="{{$user->id}}">
                                <div class="form-group">
                                    <label for="firstname">{{__('First Name')}}</label>
                                    <input name="first_name" value="{{old('name',$user->first_name)}}" type="text" class="form-control" id="firstname" placeholder="{{__('First name')}}">
                                    @error('first_name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="lasttname">{{__('Last Name')}}</label>
                                    <input name="last_name" value="{{old('name',$user->last_name)}}" type="text" class="form-control" id="lasttname" placeholder="{{__('Last name')}}">
                                    @error('last_name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="lastname">{{__('Nick Name')}}</label>
                                    <input  value="{{old('username',$user->username)}}" readonly type="text" class="form-control" id="lastname" placeholder="{{__('User Name')}}">
                                    @error('user_name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="email">{{__('Email')}}</label>
                                    <input type="email" value="{{$user->email}}" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="email">{{__('Role')}}</label>
                                    <select name="role" class="form-control">
                                        <option value="">{{__('Select')}}</option>
                                        @if(isset($roles))
                                            @foreach($roles as $role)
                                                <option value="{{$role->id}}" {{$role->id == $user->role_id ? 'selected' : ''}}>{{$role->title}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <button type="submit" class="button-primary theme-btn">{{__('Update')}}</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /User Management -->
@endsection

@section('script')
@endsection
