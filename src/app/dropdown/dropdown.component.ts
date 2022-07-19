import { Component, OnInit, Input,Output,EventEmitter } from '@angular/core';

@Component({
  selector: 'app-dropdown',
  templateUrl: './dropdown.component.html',
  styleUrls: ['./dropdown.component.css']
})

export class DropdownComponent implements OnInit {
  @Input() Items: string[] = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  @Input() SelectedItem: string = 'Item 1';
  @Output() OnChange: EventEmitter<string> = new EventEmitter<string>();
  Show: boolean = false
  constructor() { }

  ngOnInit(): void {
  }
  toggle() {
    this.Show = !this.Show;
}
select(item: string) {
  this.SelectedItem = item;
  this.OnChange.emit(this.SelectedItem);
  this.toggle();
}
}
