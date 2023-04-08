@if(empty($dispute->assigned_admin))
<div class="col-md-12 ">
    <div class="profile-info-form dispute-assign">
        <div class="card-body">

            {{Form::open(['route'=>'adminAssignDisputeAdmin', 'files' => true])}}
            <div class="row">
                <div class="col-md-4">
                    <h5>{{ __('Assign admin who handle this dispute') }}</h4>
                    <input type="hidden" name="dispute_id" value="{{ $dispute->unique_code }}">
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <div class="controls">
                            <select name="assigned_admin" id="" class="form-control">
                                <option value="">{{ __('Select') }}</option>
                                @if(isset($admins[0]))
                                    @foreach($admins as $value)
                                        <option value="{{$value->id}}">{{ $value->first_name.' '.$value->last_name }}</option>
                                    @endforeach
                                @endif
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-1">
                    <button class="btn btn-success" type="submit">{{ __('Assign') }}</button>
                </div>
            </div>
            {{Form::close()}}

        </div>
    </div>
</div>
@endif
