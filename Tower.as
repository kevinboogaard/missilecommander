package 
{
    import Tower.*;
    import flash.display.*;
    import flash.events.*;
    import utils.*;

    public class Tower extends Sprite
    {
        private var asset:otower;
        private var _mouseLocation:Vector2D;

        public function Tower()
        {
            _mouseLocation = new Vector2D();
            asset = new otower();
            addChild(asset);
            if (stage)
            {
                init();
            }
            else
            {
                addEventListener("addedToStage", init);
            }
            return;
        }// end function

        private function init(event:Event = null) : void
        {
            removeEventListener("addedToStage", init);
            stage.addEventListener("mouseMove", turretRotation);
            return;
        }// end function

        private function turretRotation(event:MouseEvent) : void
        {
            this.rotation = 0;
            _mouseLocation.y = mouseY;
            _mouseLocation.x = mouseX;
            this.rotation = _mouseLocation.angle * 180 / 3.14159;
            return;
        }// end function

    }
}
