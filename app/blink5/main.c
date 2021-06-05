#include <led.h>
#include <timer.h>

int main(void) {
  int i_led = 0;

  // Wait for some time before start
  delay_ms(10000);

  // Turn the LED on and off
  for (int count = 0; count < 3; count++) {
    led_on(i_led);
    delay_ms(5000);
    led_off(i_led);
    delay_ms(5000);
  }

  led_off(i_led);
}
