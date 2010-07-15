package {
    import flash.display.Sprite;
    import flash.text.TextField;

    public class Leilao extends Sprite {

        public function Leilao() {

            var textField:TextField = new TextField();
            textField.text = "Hello, world!";
            addChild(textField);

            var g:gui = new gui();
            g.x = 30;
            g.y = 30;
            addChild(g);

            trace("Hello, world!");
        }
    }
}
