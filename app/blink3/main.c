#include <led.h>
#include <timer.h>

int main(void) {
  int i_led = 0;
  int j_led = 1;

  // Wait for some time before start
  delay_ms(15000);

  // Turn the LEDs on and off
  for (int count = 0; count < 5; count++) {
    led_on(i_led);
    led_on(j_led);
    delay_ms(3000);
    led_off(i_led);
    led_off(j_led);
    delay_ms(3000);
  }
}
