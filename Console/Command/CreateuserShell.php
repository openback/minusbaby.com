<?php
class CreateUserShell extends Shell {
    var $uses = array('User');

    function main() {
        App::import('Component','Auth');

        $this->out('Create Admin User:');
        $this->hr();

        while (empty($username)) {
            $username = $this->in('Username:');
            if (empty($username)) $this->out('Username must not be empty!');
        }

        while (empty($pwd1)) {
            $pwd1 = $this->in('Password:');
            if (empty($pwd1)) $this->out('Password must not be empty!');
        }

        while (empty($pwd2)) {
            $pwd2 = $this->in('Password Confirmation:');
            if ($pwd1 !== $pwd2) {
                $this->out('Password and confirmation do not match!');
                $pwd2 = NULL;
            }
        }

        // we got all the data, let's create the user
        $this->User->create();
        if ($this->User->save(array('username' => $username, 'password' => $pwd1))) {
            $this->out('Admin User created successfully!');
        } else {
            $this->out('ERROR while creating the Admin User!!!');
        }
    }
}
?>
