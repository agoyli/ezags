<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use TCG\Voyager\Models\Role;

class RolesTableSeeder extends Seeder
{
    /**
     * Auto generated seed file.
     */
    public function run()
    {
        $role = Role::firstOrNew(['name' => User::ROLE_ADMIN]);
        if (!$role->exists) {
            $role->fill([
                'display_name' => ''
            ])->save();
        }

        $role = Role::firstOrNew(['name' =>  User::ROLE_HOSPITAL]);
        if (!$role->exists) {
            $role->fill([
                'display_name' => ''
            ])->save();
        }

        $role = Role::firstOrNew(['name' => User::ROLE_PARENT]);
        if (!$role->exists) {
            $role->fill([
                'display_name' => ''
            ])->save();
        }

        $role = Role::firstOrNew(['name' => User::ROLE_CHILDREN_SERVICE]);
        if (!$role->exists) {
            $role->fill([
                'display_name' => ''
            ])->save();
        }

        $role = Role::firstOrNew(['name' =>  User::ROLE_MARRIAGE_REGISTRY]);
        if (!$role->exists) {
            $role->fill([
                'display_name' => ''
            ])->save();
        }
    }
}
