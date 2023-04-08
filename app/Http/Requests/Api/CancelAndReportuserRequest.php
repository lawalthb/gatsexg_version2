<?php

namespace App\Http\Requests\Api;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\ValidationException;

class CancelAndReportuserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rule = [
            'order_id' => 'required',
            'type' => 'required',
            'reason' => 'required',
        ];
        if($this->attach_file) {
            $rule['attach_file'] = 'mimes:jpeg,png,jpg|max:2048';
        }

        return $rule;
    }

    public function messages()
    {
        $messages=[
            'order_id.required' => __('Order Id can\'t be empty.'),
            'type.required'=>__('Type can\'t be empty.'),
            'reason.required'=>__('Reason can\'t be empty.')
        ];
        if($this->attach_file) {
            $messages['attach_file.mimes'] = __('File extension missing');
        }
        return $messages;
    }

    protected function failedValidation(Validator $validator)
    {
        if ($this->header('accept') == "application/json") {
            $errors = [];
            if ($validator->fails()) {
                $e = $validator->errors()->all();
                foreach ($e as $error) {
                    $errors[] = $error;
                }
            }
            $json = [
                'success'=>false,
                'data'=>null,
                'message' => $errors[0],
            ];
            $response = new JsonResponse($json, 200);

            throw (new ValidationException($validator, $response))->errorBag($this->errorBag)->redirectTo($this->getRedirectUrl());
        } else {
            throw (new ValidationException($validator))
                ->errorBag($this->errorBag)
                ->redirectTo($this->getRedirectUrl());
        }

    }
}
