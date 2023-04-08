@if($type == 'seller' && is_null($item->seller_feedback))
                <form action="{{route('updateFeedback')}}" method="POST" enctype="multipart/form-data"
                      id="">
                    @csrf
                    <div class="feedback-wraper">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="cp-user-payment-type mb-3">
                                    <input type="hidden" name="order_id" value="{{$item->id}}">
                                    <input type="hidden" name="type" value="{{$type}}">
                                    <h3 class="text-success">{{__('Now you can give feedback to ')}} {{$type == 'seller' ? __('Buyer') : __('Seller')}}</h3>
                                    <select required name="seller_feedback" class=" form-control" >
                                        <option value="">{{__('Select feedback')}}</option>
                                        @foreach(feedback_status() as $key => $value)
                                            <option @if(old('seller_feedback') == $key) selected @endif value="{{$key}}">{!! $value !!}</option>
                                        @endforeach
                                    </select>
                                    <span class="text-warning"><strong>{{__('Once you update the feedback you never change it')}}</strong></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="cp-user-payment-type feedback-btn">
                                    <button class="btn btn-info" type="submit">{{__('Submit Feedback For Buyer')}}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            @endif
            @if($type == 'buyer' && is_null($item->buyer_feedback))
                <form action="{{route('updateFeedback')}}" method="POST" enctype="multipart/form-data"
                      id="">
                    @csrf
                    <div class="feedback-wraper">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="cp-user-payment-type mt-1">
                                    <input type="hidden" name="order_id" value="{{$item->id}}">
                                    <input type="hidden" name="type" value="{{$type}}">
                                    <h3 class="text-success">{{__('Now you can give feedback to ')}} {{$type == 'seller' ? __('Buyer') : __('Seller')}}</h3>
                                    <select required name="buyer_feedback" class=" form-control" >
                                        <option value="">{{__('Select feedback')}}</option>
                                        @foreach(feedback_status() as $key => $value)
                                            <option @if(old('buyer_feedback') == $key) selected @endif value="{{$key}}">{!! $value !!}</option>
                                        @endforeach
                                    </select>
                                    <span class="text-warning"><strong>{{__('Once you update the feedback you never change it')}}</strong></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="cp-user-payment-type feedback-btn">
                                    <button class="btn btn-info" type="submit">{{__('Submit Feedback For Seller')}}</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            @endif
