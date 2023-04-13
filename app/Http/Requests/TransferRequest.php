<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\ValidationException;

class TransferRequest extends FormRequest
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
            // 'email' => ['required', 'string', 'email', 'max:255', 'exists:users,email'],
            'username' => ['required', 'string',  'max:255', 'exists:users,username'],
            'amount' => ['required','numeric'],
            'wallet' => ['required', 'string', 'exists:wallets,id'],
        ];

        if (!empty($this->message)) {
            $rule['message'] = 'string';
        }

        return $rule;
    }

    protected function failedValidation(Validator $validator)
    {

        $errors = [];
        if ($validator->fails()) {
            $e = $validator->errors()->all();
            foreach ($e as $error) {
                $errors[] = $error;
            }
        }
        $json = ['success'=>false,
            'data'=>[],
            'message' => $errors[0],
        ];
        $response = new JsonResponse($json, 200);

        throw (new ValidationException($validator, $response))->errorBag($this->errorBag)->redirectTo($this->getRedirectUrl());


    }
}