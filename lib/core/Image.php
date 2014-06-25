<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Image
 *
 * @author delimce
 */
class Image {

    //clase para el tratamiento de imagenes

    private $path;
    private $nombre;
    private $format;
    private $height;
    private $wide;
    private $img;
    private $data;

    public function __construct($path) {
        $this->path = $path;
        $this->nombre = basename($path);

        $this->datos = getimagesize($this->path);



        if ($this->data[2] == 1) {
            $this->img = @imagecreatefromgif($this->path);
        }
        if ($this->data[2] == 2) {
            $this->img = @imagecreatefromjpeg($this->path);
        }
        if ($this->data[2] == 3) {
            $this->img = @imagecreatefrompng($this->path);
        }


        $this->height = ImageSX($this->img);
        $this->wide = ImageSY($this->img);
    }

    
    
    /*
     * funcion para redimensionar la imagen
     */
    
    public function resizing($path, $wide, $height,$porcent=true) {


		if($porcent){


			if($this->height > $this->wide){
				//////redimensiona por porcentaje de alto
				$height =  round(($wide*$this->height)/$this->wide);

			}else{
				//////redimensiona por porcentaje de ancho
				$wide =  round(($height*$this->wide)/$this->height);

			}

		}

		// crear una imagen nueva
		$imagen = imagecreatetruecolor($wide,$height);
		// redimensiona la imagen original copiandola en la imagen
		@ImageCopyResampled($imagen,$this->img,0,0,0,0,$wide,$height,$this->wide,$this->height);
		// guardar la nueva imagen redimensionada donde indicia $img_nueva

		if($this->data[2]==2) imagejpeg($imagen,$path,100); else if($this->data[2]==1) imagegif($imagen,$path,100);


	}  ///// fin redimensionar
        
        
        /**
         * funcion para destruir la imagen
         */
      public function destroy(){
          
          ImageDestroy($this->img);
      }
    
}

?>
