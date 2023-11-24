module hello_world::hello_world{
    //module内容

    //imports
    use std::string;
    use sui::object::{Self,UID};
    use sui::transfer;
    use sui::tx_context::{Self,TxContext};

    //types
    struct HelloWorldObject has key,store {
        id: UID,
        text: string::String
    }

    //functions
    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),
            text: string::utf8(b"Hello world!")
        };
        transfer::transfer(object,tx_context::sender(ctx));

    }


}