public abstract class Dog extends Animal {
    //public override void sound() {
    //    System.debug('Bark');
    //}
    
    // marking the overrided method as abstract allow not needing to use its method
    // The class are required to be abstract as well.
    public override abstract void sound();
    
    public void wagsTail() {
        System.debug('Wag tail');
    }
    
    // Dog d = new Dog();
    // d.sound();
    // Animal a = new Animal();
}