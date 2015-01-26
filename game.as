package 
{
    import flash.display.*;
    import flash.events.*;
    import game.*;

    public class game extends Sprite
    {
        private var rocketSpeed:int = 16;
        private var Rocketarray:Array;
        private var AantalTowers:int = 3;
        private var TowerArray:Array;
        private var rockets:Array;
        private var Random:Number;

        public function game() : void
        {
            Rocketarray = [];
            TowerArray = [];
            rockets = [];
            Random = Math.floor(Math.random() * 3);
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
            var _loc_2:* = 0;
            removeEventListener("addedToStage", init);
            _loc_2 = 0;
            while (_loc_2 < AantalTowers)
            {
                
                createTower();
                TowerArray[_loc_2].x = stage.stageWidth / (AantalTowers - 1) * _loc_2;
                TowerArray[_loc_2].y = stage.stageHeight - TowerArray[_loc_2].height;
                _loc_2++;
            }
            stage.addEventListener("click", click);
            stage.addEventListener("enterFrame", loop);
            return;
        }// end function

        private function loop(event:Event) : void
        {
            updateRocket();
            return;
        }// end function

        private function updateRocket() : void
        {
            var _loc_6:* = 0;
            var _loc_5:* = NaN;
            var _loc_2:* = mouseY;
            _loc_6 = 0;
            while (_loc_6 < rockets.length)
            {
                
                _loc_5 = Rocketarray[_loc_6].rotation;
                var _loc_1:* = _loc_5 / (180 / 3.14159);
                var _loc_3:* = Math.cos(_loc_1) * rocketSpeed;
                var _loc_4:* = Math.sin(_loc_1) * rocketSpeed;
                Rocketarray[_loc_6].y = Rocketarray[_loc_6].y - _loc_2;
                _loc_6++;
            }
            return;
        }// end function

        private function createTower() : void
        {
            var _loc_1:* = new Tower();
            addChild(_loc_1);
            TowerArray.push(_loc_1);
            return;
        }// end function

        private function click(event:MouseEvent) : void
        {
            var _loc_5:* = 0;
            var _loc_3:* = null;
            var _loc_4:* = NaN;
            _loc_5 = 0;
            while (_loc_5 < TowerArray.length)
            {
                
                _loc_3 = new Rocket();
                rockets.push(_loc_3);
                addChild(_loc_3);
                _loc_4 = Math.cos(rockets.rotation / 180 * 3.14159);
                var _loc_2:* = Math.sin(rockets.rotation / 180 * 3.14159);
                _loc_3.x = TowerArray[_loc_5].x;
                _loc_3.y = TowerArray[_loc_5].y;
                rockets.rotation = TowerArray[_loc_5].rotation;
                Rocketarray.push(_loc_3);
                addChildAt(_loc_3, 0);
                this.trace("x = " + _loc_3.x);
                this.trace("y = " + _loc_3.y);
                _loc_5++;
            }
            return;
        }// end function

    }
}
