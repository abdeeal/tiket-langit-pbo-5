<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile - TiketLangit</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-white text-[#002B5B]">
    <div class="max-w-7xl mx-auto px-8 py-16 grid grid-cols-1 md:grid-cols-2 gap-16 items-start">

        <!-- bagian kiri -->
        <div class="space-y-10">
           
            <div class="flex flex-col items-center">
                <div class="w-28 h-28 rounded-full overflow-hidden border-4 border-[#002B5B]">
                    <img src="https://via.placeholder.com/150" alt="Avatar" class="w-full h-full object-cover" />
                </div>
                <h2 class="text-xl font-bold mt-4">Masum Rana</h2>
                <div class="flex items-center text-sm text-gray-600 mt-1">
                    <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd"
                            d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z"
                            clip-rule="evenodd" />
                    </svg>
                    Gothenburg
                </div>
            </div>

            
            <div>
                <h3 class="text-lg font-semibold mb-4">Personal Information</h3>
                <div class="space-y-4">
                    <div>
                        <label class="block text-sm mb-1">Name</label>
                        <input type="text" value="Masum Rana" class="w-full bg-gray-100 px-4 py-2 rounded-md text-sm"
                            readonly />
                    </div>
                    <div>
                        <label class="block text-sm mb-1">Email</label>
                        <input type="text" value="MASUMRANA@GMAIL.COM"
                            class="w-full bg-gray-100 px-4 py-2 rounded-md text-sm uppercase" readonly />
                    </div>
                    <div>
                        <label class="block text-sm mb-1">Phone</label>
                        <input type="text" value="+46-7644 394 68"
                            class="w-full bg-gray-100 px-4 py-2 rounded-md text-sm" readonly />
                    </div>
                    <div>
                        <label class="block text-sm mb-1">Location</label>
                        <input type="text" value="Gothenburg" class="w-full bg-gray-100 px-4 py-2 rounded-md text-sm"
                            readonly />
                    </div>
                </div>
            </div>
        </div>

        <!-- bagian kanan -->
        <div class="flex flex-col items-center justify-center h-full relative">
            <div class="flex flex-col items-center gap-6">
                <h3 class="text-lg font-semibold self-start">Payment</h3>

                <!-- Card -->
                <div class="bg-sky-300 text-white rounded-lg w-80 p-6 relative shadow-md">
                    <div class="text-xl font-bold tracking-widest mb-4">**** **** **** 4321</div>
                    <div class="text-sm uppercase">Valid Thru</div>
                    <div class="text-lg font-semibold mb-2">02/27</div>
                    <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Visa.svg" alt="VISA"
                        class="absolute bottom-4 right-4 w-10" />
                    <button class="absolute top-3 right-3 text-white hover:text-gray-200">
                        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M6 6h8v2H6V6zm0 4h8v2H6v-2zm0 4h8v2H6v-2z" />
                        </svg>
                    </button>
                </div>

                <!-- Add Card -->
                <div
                    class="w-80 h-40 border-2 border-dashed border-sky-300 rounded-lg flex items-center justify-center flex-col cursor-pointer hover:bg-sky-50">
                    <div class="text-sky-400 text-3xl">+</div>
                    <p class="text-sm text-sky-600 mt-2">Add a new card</p>
                </div>
            </div>

            <!-- Save Button di kanan bawah -->
            <div class="absolute bottom-0 right-0">
                <button class="bg-[#002B5B] text-white px-6 py-2 rounded-md mt-8 hover:bg-blue-800">
                    Save
                </button>
            </div>
        </div>

    </div>
</body>

</html>