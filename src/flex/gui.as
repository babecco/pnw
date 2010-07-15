package {
    import flash.display.Sprite;
    import flash.text.TextField;

    public class gui extends Sprite {
        public var titulo:TextField;
        public var tempo:TextField;

        public var lote_menor:TextField;
        public var lote:TextField;

        public function gui()
        {
            var XY = 20;

            titulo = new TextField();
            titulo.text = "Titulo do lote";
            titulo.x = XY;
            titulo.y = XY;
            addChild(titulo);

            tempo = new TextField();
            tempo.text = "00:00";
            tempo.x = titulo.width + titulo.x + 50;
            tempo.y = XY;
            addChild(tempo);

            var label:TextField = new TextField();
            label.width = 200;
            label.x = XY;
            label.y = XY + titulo.height + XY;
            label.text = "Menor lance até o momento:";
            addChild(label);


        }
    }
}
