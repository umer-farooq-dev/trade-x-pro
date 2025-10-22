<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\CollectionInformation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CollectionInformationController extends Controller
{
    public function submit(Request $request)
    {
        $validated = $request->validate([
            'full_name' => 'required|string|max:255',
            'bank_name' => 'required|string|max:255',
            'account_number' => 'required|string|max:50',
            'ifsc' => 'required|string|max:11',
        ]);

        try {
            $data = [
                'full_name' => $validated['full_name'],
                'bank_name' => $validated['bank_name'],
                'account_number' => $validated['account_number'],
                'ifsc' => $validated['ifsc'],
            ];

            CollectionInformation::create([
                'user_id' => Auth::id(),
                'data' => json_encode($data),
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Collection information submitted successfully!',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to submit collection information.',
            ], 500);
        }
    }
}
